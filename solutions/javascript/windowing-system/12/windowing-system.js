// @ts-check

export function Size(width, height) {
    this.width = width?? 80;
    this.height = height?? 60;
}

Size.prototype.resize = function (newWidth, newHeight) {
    this.width = newWidth?? this.width;
    this.height = newHeight?? this.height;
}

export function Position(x, y) {
    this.x = x?? 0;
    this.y = y?? 0;
}

Position.prototype.move = function (newX, newY) {
    this.x = newX?? this.x;
    this.y = newY?? this.y;
}

export class ProgramWindow {
    constructor() {
        this.screenSize = new Size(800, 600);
        this.size = new Size();
        this.position = new Position();
    }

    resize(newSize) {
        const newWidth = this.#clampParam(
            newSize.width, 1, this.screenSize.width, this.position.x
        );
        const newHeight = this.#clampParam(
            newSize.height, 1, this.screenSize.height, this.position.y
        );

        this.size.resize(newWidth, newHeight);
    }

    move(newPosition) {
        const newX = this.#clampParam(
            newPosition.x, 0, this.screenSize.width, this.size.width
        );
        const newY = this.#clampParam(
            newPosition.y, 0, this.screenSize.height, this.size.height
        );

        this.position.move(newX, newY);
    }

    #clampParam(targetVal, min, max, currCorr) {
        const maxVal = max - currCorr;
        return Math.max(min, Math.min(maxVal, targetVal));
    }
}

export function changeWindow(programWindow) {
    programWindow.resize(new Size(400, 300));
    programWindow.move(new Position(100, 150));
    return programWindow;
}
