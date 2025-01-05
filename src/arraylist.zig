const std = @import("std");
const expect = std.testing.expect;

pub fn ArrayList(comptime T: type) type {
    return struct {
        array: []T,
        allocator: std.mem.Allocator,
        len: usize,
        max_size: usize,

        const Self = @This();


        pub fn new(allocator: std.mem.Allocator) ArrayList(T) {            
            const m = allocator.alloc(T, 10) catch {
                @panic("Unable to allocate memory");
            };
            return .{
                .array = m,
                .allocator = allocator,
                .len = 0,
                .max_size = 10
            };
        }


        pub fn append(self: *Self, value: T) !void {
            
            if (self.max_size-10 <= self.len) {
                self.max_size += 10;
            }

            self.array = try self.allocator.realloc(self.array, self.max_size);
            self.array[self.len] = value;
            self.len += 1;
        }

        pub fn destroy(self: *Self) void {
            self.allocator.free(self.array);
        }

    };
}
