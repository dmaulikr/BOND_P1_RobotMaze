import Foundation

extension ControlCenter {

	func randomlyRotateRightOrLeft(robot: ComplexRobotObject) {
		let randomNumber = getRandomIntInRange(2)

		if randomNumber == 0 {
			robot.rotateLeft()
		} else {
			robot.rotateRight()
		}
	}

	func continueStraightOrRotate(robot: ComplexRobotObject) {
		let randomNumber = getRandomIntInRange(2)

		if randomNumber == 0 {
			robot.move()
		} else {
			turnTowardClearPath(robot, wallInfo: checkWalls(robot))
		}
	}

	func turnTowardClearPath(robot: ComplexRobotObject, wallInfo: (up: Bool, down: Bool, left: Bool, right: Bool, numOfWalls: Int)) {

		if robot.direction == .Left && wallInfo.down {
			robot.rotateRight()
		} else if robot.direction == .Up && wallInfo.left {
			robot.rotateRight()
		} else if robot.direction == .Down && wallInfo.right {
			robot.rotateRight()
		} else if robot.direction == .Right && wallInfo.up {
			robot.rotateRight()
		} else {
			robot.rotateLeft()
		}
	}

	func getRandomIntInRange(range: Int) -> Int {
		return Int(arc4random() % UInt32(range))
	}
}