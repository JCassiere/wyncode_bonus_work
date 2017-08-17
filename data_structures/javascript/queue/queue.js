class Queue {

  constructor(){
    this.queue = [];
  }
  
  enqueue(element) {
    this.queue << (element);
  }
  
  dequeue() {
    return(this.queue.shift);
  }

  peek() {
    return(this.queue[0]);
  }
 
}