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
        const maxWidth = this.screenSize.width - this.position.x;
        const maxHeight = this.screenSize.height - this.position.y;

        let newWidth = Math.max(1, Math.min(maxWidth, newSize.width));
        let newHeight = Math.max(1, Math.min(maxHeight, newSize.height));

        this.size.resize(newWidth, newHeight);
    }

    move(newPosition) {
        let newX = newPosition.x > 0 ? newPosition.x : 0;
        let newY = newPosition.y > 0 ? newPosition.y : 0;

        const maxX = this.screenSize.width - this.size.width;
        const maxY = this.screenSize.height - this.size.height;

        this.position.x = Math.min(maxX, newX);
        this.position.y = Math.min(maxY, newY);
    }
}

export function changeWindow(programWindow) {
    programWindow.resize(new Size(400, 300));
    programWindow.move(new Position(100, 150));
    return programWindow;
}
