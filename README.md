# Objective-C KVO: Observer Not Removed

This repository demonstrates a common issue in Objective-C when using Key-Value Observing (KVO): failing to remove observers properly.  When an object is deallocated while still observing another object, it can lead to crashes or unexpected behavior, especially if retain cycles are introduced.

The `bug.m` file shows the incorrect implementation, where the observer is not removed.  `bugSolution.m` provides the corrected version.  The solution highlights the importance of removing observers in the `-dealloc` method to prevent these issues.

## How to Reproduce
1. Clone this repository.
2. Compile and run `bug.m`.  You'll likely observe a crash.
3. Then compile and run `bugSolution.m`. This should run without issue.

## Key Points
* Always remove KVO observers in `-dealloc`.
* Be careful to remove observers in other cleanup scenarios (such as view controller transitions or when object references are lost).
* Utilize weak references where appropriate to reduce retain cycles.