# [UIRefreshControl tintColor is not applied on initial refresh (rdar://16559598)](rdar://16559598)

## Description

If you apply a `tintColor` to `UIRefreshControl` and then call `beginRefreshing` immediately, the actual color of the control will be black.

This is problematic because often a view should be refreshed when it is opened, and we want to indicate to the user that a refresh is in progress.

## Steps to reproduce

1. In `viewDidLoad` call `[self.refreshControl beginRefreshing];`.

Note that if you wait until the next run loop (say with a dispatch to the main queue), the color will be correct. Also, a user initiated refresh (which would be after the next run loop anyway) will be the correct color.

## Expected results

The refresh controls tint color should be updated immediately, or, at the very least, should be updated as long as it is called before `beginRefreshing`.

## Actual results

The refresh control is tinted black for the first refresh. Note that this is different from the default, which is blueish. This is true even if you don't set the `tintColor`, but is less noticeable.