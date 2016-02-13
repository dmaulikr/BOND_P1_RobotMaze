# Robot Maze

- The function `moveComplexRobot()` calls `isFacingWall()`
- The function `isFacingWall()` returns and its return value is used to set `robotIsBlocked`
- The value of `robotIsBlocked` determines whether to call either of two functions
    - if `randomlyRotateRightOrLeft()` is called, a random number is generated
    - if `continueStraightOrRotate()` is called, a random number is generated
        - The value of the random number determines whether to call `randomlyRotateRightOrLeft()` or `move()`
