import Foundation

extension ControlCenter {

	func isFacingWall(robot: ComplexRobotObject, direction: MazeDirection) -> Bool {

		let cell = mazeController.currentCell(robot)
		var isWall: Bool = false

		switch (direction) {
		case .Up:
			isWall = cell.top
		case .Down:
			isWall = cell.bottom
		case .Left:
			isWall = cell.left
		case .Right:
			isWall = cell.right
		}

		return isWall
	}

	func checkWalls(robot: ComplexRobotObject) -> (up: Bool, down: Bool, left: Bool, right: Bool, numOfWalls: Int) {
		let cell = mazeController.currentCell(robot)
		var numOfWalls = 0

		let isWallUp = cell.top
		if isWallUp {
			numOfWalls++
		}

		let isWallRight = cell.right
		if isWallRight {
			numOfWalls++
		}

		let isWallLeft = cell.left
		if isWallLeft {
			numOfWalls++
		}

		let isWallBottom = cell.bottom
		if isWallBottom {
			numOfWalls++
		}

		return (isWallUp, isWallBottom, isWallLeft, isWallRight, numOfWalls)
	}
}