var _matrix=null;
var mosse = 0;
var timer;
function shuffle(imgArray) {
    var j, x, i;
    for (i = imgArray.length - 1; i > 0; i--) {
        j = Math.floor(Math.random() * (i + 1));
        x = imgArray[i];
        imgArray[i] = imgArray[j];
        imgArray[j] = x;
    }
    return imgArray;
}
function removeNine(imgArray){
  for (var j=0;j<imgArray.length;j++){
    if (imgArray[j] == '9'){
      imgArray[j] = null;
      return imgArray;
    }
  }
}
function addImages(imgArray){
  for (var j=0;j<imgArray.length;j++){
    if (imgArray[j] == null){
      var img = jQuery('<img id="'+ 0 +'">');
      img.attr('src', 'img/' +'0.png');
      img.attr('class', 'style-game-number');
      img.attr('draggable', 'false');
      img.appendTo('#game');
    }else{
      var img = jQuery('<img id="'+ imgArray[j] +'">');
      img.attr('src', 'img/' + imgArray[j] + '.png');
      img.attr('class', 'style-game-number');
      img.attr('draggable', 'false');
      img.attr('onclick', 'clickEvent(this.id)');
      img.appendTo('#game');
    }
  }
}
function arrayToMatrix(imgArray){
  var numberMatrix = [];
  t=0;
  tempArray= new Array();
  for (var j=0; j<imgArray.length;j++){
    tempArray[t] = imgArray[j];
    t++;
    if (t == 3){
      numberMatrix.push(tempArray);
      tempArray= new Array();
      t=0;
    }
  }
  return numberMatrix;
}
function move(element, oldPosition, newPosition, matrix){
  console.log("new " + newPosition);
  console.log("old " + oldPosition);
  // move old position with new position
  matrix[oldPosition[0]][oldPosition[1]] = null;
  matrix[newPosition[0]][newPosition[1]] = parseInt(element);
  // remove game element child
  var myNode = document.getElementById("game");
  while (myNode.firstChild) {
      myNode.removeChild(myNode.firstChild);
  }
  // matrix to array
  var newArray = new Array();
  for(var i = 0; i < matrix.length; i++){
    newArray = newArray.concat(matrix[i]);
  }
  addImages(newArray);
  return true;
}
function checkFreePosition(newPosition, matrix, element, oldPosition){
  if((matrix[newPosition[0]][newPosition[1]]) == null){
    return move(element, oldPosition, newPosition, matrix);
  }else{
    return false;
  }
}
function getElementPosition(element, matrix){
  for (var i=0; i<matrix.length;i++){
    for(var j=0; j<matrix.length;j++){
      if (matrix[i][j] == element){
        return new Array(i, j);
      }
    }
  }
  return false;
}
function checkValidPosition(move, element, matrix){
  var position = getElementPosition(element, matrix);
  if (!position){
    return false;
  }
  var oldPosition = getElementPosition(element, matrix);
  switch (move) {
    case 'destra':
      var j = position[1] + 1;
      if (j < 3){
        var newPosition = position;
        newPosition[1] = j;
        return checkFreePosition(newPosition, matrix, element, oldPosition);
      }else{
        return false;
      }
      break;
    case 'sinistra':
      var j = position[1] - 1;
      if (j >= 0){
        var newPosition = position;
        newPosition[1] = j;
        return checkFreePosition(newPosition, matrix, element, oldPosition);
      }else{
        return false;
      }
      break;
    case 'alto':
      var i = position[0] - 1;
      if (i >= 0){
        var newPosition = position;
        newPosition[0] = i;
        return checkFreePosition(newPosition, matrix, element, oldPosition);
      }else{
        return false;
      }
      break;
    case 'basso':
      var i = position[0] + 1;
      if (i < 3){
        var newPosition = position;
        newPosition[0] = i;
        return checkFreePosition(newPosition, matrix, element, oldPosition);
      }else{
        return false;
      }
      break;
    default:
  }
}
function isSorted(matrix){
  // matrix to array
  var newArray = new Array();
  for(var i = 0; i < matrix.length; i++){
    newArray = newArray.concat(matrix[i]);
  }
  var sorted = true;
  for (var i = 0; i < newArray.length - 2; i++) {
    if (newArray[i] > newArray[i+1]) {
        sorted = false;
        return false;
    }
  }
  console.log(newArray);
  return true;
}
function clickEvent(id){
  var mosse = ['alto', 'basso', 'sinistra', 'destra'];
  for (var i=0; i < mosse.length;i++){
    // check if next position is possible
    var validPosition = checkValidPosition(mosse[i], id, _matrix);
    //console.log(mosse[i] + " " + validPosition);
    //console.log(_matrix);
    if (validPosition){
      this.mosse++;
      document.getElementById('mosse').innerHTML = this.mosse;
      if(isSorted(_matrix)){
        this.timer.pause();
        flatAlert('HAI VINTO', 'Mosse: ' + this.mosse + "\n" + " Tempo: " + timer.getTimeValues().toString(['hours', 'minutes', 'seconds', 'secondTenths']), 'success', '');
      }
      break;
    }
  }
  return false;
}
function init(){
  jQuery('#btn-new').hide();
  jQuery('#btn-back').show();
  jQuery('#github').remove();
  this.mosse = 0;
  document.getElementById('mosse').innerHTML = this.mosse;
  // svuota il div
  jQuery('#game').empty();
  // add timer
  this.timer = new easytimer.Timer();
  timer.start({precision: 'secondTenths'});
  timer.addEventListener('secondTenthsUpdated', function (e) {
      jQuery('#timer .values').html(timer.getTimeValues().toString(['hours', 'minutes', 'seconds', 'secondTenths']));
  });
  // fill imgArray with images
  var imgArray = new Array();
  for (var i=0; i < 9;i++){
    imgArray[i] = i + 1;
  }
  // shuffle array
  imgArray = shuffle(imgArray);
  // remove 9th element
  imgArray = removeNine(imgArray);
  // add image to DOM
  addImages(imgArray);
  // convert array to 2d array
  var matrix = arrayToMatrix(imgArray);
  this._matrix = matrix;
  console.log(matrix);
}
function flatAlert(titolo, testo, icona, url){
  swal({
    title: titolo,
    text: testo,
    icon: icona,
  }).then(azione => {
    if (azione){
      location.href = url;
    }else{
      location.href = url;
    }
  });
}
