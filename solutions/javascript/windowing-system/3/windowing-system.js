// @ts-check

export function Size(width = 80, height = 60) {
    this.width = width;
    this.height = height;
}

Size.prototype.resize = function (newWidth = this.width, newHeight = this.height) {
    this.width = newWidth;
    this.height = newHeight;
}

export function Position(x = 0, y = 0) {
    this.x = x;
    this.y = y;
}

Position.prototype.move = function (newX = this.x, newY = this.y) {
    this.x = newX;
    this.y = newY;
}

export class ProgramWindow {
    constructor() {
        this.screenSize = new Size(800, 600);
        this.size = new Size();
        this.position = new Position();
    }

    resize(newSize) {
        let newWidth = newSize.width > 1 ? newSize.width : 1;
        let newHeight = newSize.height > 1 ? newSize.height : 1;

        if ((this.position.x + newWidth) > this.screenSize.width) {
            newWidth = this.screenSize.width - this.position.x;
        }

        if ((this.position.y + newHeight) > this.screenSize.height) {
            newHeight = this.screenSize.height - this.position.y;
        }


        this.size.width = newWidth;
        this.size.height = newHeight;
    }

    move(newPosition) {
        let newX = newPosition.x > 0 ? newPosition.x : 0;
        let newY = newPosition.y > 0 ? newPosition.y : 0;

        if ((this.size.width + newX) > this.screenSize.width) {
            newX = this.screenSize.width - this.size.width;
        }

        if ((this.size.height + newY) > this.screenSize.height) {
            newY = this.screenSize.height - this.size.height;
        }

        this.position.x = newX;
        this.position.y = newY;
    }
}

export function changeWindow(programWindow) {
    programWindow.resize(new Size(400, 300));
    programWindow.move(new Position(100, 150));
    return programWindow;
}
