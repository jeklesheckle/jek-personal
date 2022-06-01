/*
 * Temporary TODO:
 * * print the whole thing 
 */
use std::fs::File;
use std::io::prelude::*;

fn main() {
    let mut mkv_file = File::open("mkv_sample.mkv").expect("Error opening file");
    let mut mkv_contents = String::new();
    mkv_file.read_to_string(&mut mkv_contents).expect("Error reading file to string");
    println!("{}", mkv_contents)
}

/* thread 'main' panicked at 'Error reading file to string: Error { kind: InvalidData, message: "stream did not contain valid UTF-8" }', src\main.rs:11:48
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
error: process didn't exit successfully: `target\debug\tomfuckery.exe` (exit code: 101) */

// Maybe instead of read_to_string we use some sort of read_to_binary?
