class BinaryTree {
  constructor(rootValue, left, right) {
    this.rootValue = rootValue;
    this.left = left || null;
    this.right = right || null;
  }

  setLeftChild(leftRoot, grandchildLeft, grandchildRight) {
    grandchildLeft = grandchildLeft || null;
    grandchildRight = grandchildRight || null;
    this.left = new BinaryTree(leftRoot, grandchildLeft, grandchildRight);
  }

  setRightChild(rightRoot, grandchildLeft, grandchildRight) {
    grandchildLeft = grandchildLeft || null;
    grandchildRight = grandchildRight || null;
    this.right = new BinaryTree(rightRoot, grandchildLeft, grandchildRight);
  }
}