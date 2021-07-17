const start = callback => {
    setTimeout(() => {
      callback('Hello');
      setTimeout(() => {
        callback('And Welcome');
        setTimeout(() => {
          callback('To Async Await Using TypeScript');
        }, 1000);
      }, 1000);
    }, 1000);
  };
  start(text => console.log(text));