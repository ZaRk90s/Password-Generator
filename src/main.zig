const std = @import("std");
const Allocator = std.mem.Allocator;
const print = std.debug.print;

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const characters = [75]u8{ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '=', '+' };

    var password: [14]u8 = undefined;
    const rand = std.crypto.random;

    for (password, 0..) |_, i| {
        const some_random_num = rand.intRangeLessThan(usize, 0, characters.len);
        password[i] = characters[some_random_num];
    }

    print("{s}", .{password});
}
