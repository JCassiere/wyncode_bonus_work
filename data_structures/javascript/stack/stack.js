class Stack {

  constructor() {
    this.stack = [];
  }

  push(element) {
    this.stack.push(element);
  }

  pop() {
    return(this.stack.pop());
  }

  peek() {
    return(this.stack[-1]);
  }

}