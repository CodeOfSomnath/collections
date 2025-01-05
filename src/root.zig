const std = @import("std");
const arraylist = @import("arraylist.zig");
const expact = std.testing.expect;

test "array list creation" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var b = arraylist.ArrayList(i32).new(allocator);
    std.debug.print("{any}\n", .{b});
    b.destroy();
    try expact(true);
}

test "adding elements" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var b = arraylist.ArrayList(i32).new(allocator);
    try b.append(10);
    try b.append(30);
    
    std.debug.print("{any}\n", .{b});
    b.destroy();
    try expact(true);
}

test "adding string elements" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var b = arraylist.ArrayList([]const u8).new(allocator);
    try b.append("Somnath");
    try b.append("Nandi");
    
    // std.debug.print("{any}\n", .{b});
    b.destroy();
    try expact(true);
}

