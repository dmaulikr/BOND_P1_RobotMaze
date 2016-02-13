import UIKit

class ControlCenter {

	var mazeController: MazeController!

	func moveComplexRobot(myRobot: ComplexRobotObject) {

		let wallState = checkWalls(myRobot)

		let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
		let isThreeWayJunction = (wallState.numOfWalls == 1)
		let isTwoWayPath = (wallState.numOfWalls == 2)
		let isDeadEnd = (wallState.numOfWalls == 3)

		if isThreeWayJunction && robotIsBlocked {
			randomlyRotateRightOrLeft(myRobot)
		} else if isThreeWayJunction && !robotIsBlocked {
			continueStraightOrRotate(myRobot)
		} else if isTwoWayPath && !robotIsBlocked {
			myRobot.move()
		} else if isTwoWayPath && robotIsBlocked {
			turnTowardClearPath(myRobot, wallInfo: checkWalls(myRobot))
		} else if isDeadEnd && !robotIsBlocked {
			myRobot.move()
		} else if isDeadEnd && robotIsBlocked {
			myRobot.rotateRight()
		}
	}

	func previousMoveIsFinished(robot: ComplexRobotObject) {
		self.moveComplexRobot(robot)
	}
}