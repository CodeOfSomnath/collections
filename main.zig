const std = @import("std");


pub fn main() !void {
    var gpa = std.heap.FixedBufferAllocator{};
    const allocator = gpa.allocator();
    const m = try allocator.alloc(i32, 10);
    std.debug.print("{any}", .{m});
}