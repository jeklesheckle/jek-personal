/*
 * Temporary TODO:
 * * print the whole thing 
 */
use std::fs::File;
use std::io::prelude::*;

fn main() {
    // let mut mkv_file = File::open("mkv_sample.mkv").expect("Error opening file");
    // let mut mkv_contents = String::new();
    // mkv_file.read_to_string(&mut mkv_contents).expect("Error reading file to string");
    // println!("{}", mkv_contents)

    let mkv_file = File::open("aac_test.m4a").expect("Error opening file");

    let mut bytey = String::new();

    let mut counter = 1;
    let mut maybe_newline = String::new();
    for byte in mkv_file.bytes() {
        if counter % 8 == 0 {
            maybe_newline = "\n".to_string();
        }
        match byte {
            Ok(lil_byte) => bytey = /*bytey + "[" + &lil_byte.to_string() + "]\t" + &maybe_newline,*/ format!("{}[{:#010b}]\t{}", bytey, &lil_byte, &maybe_newline),
            Err(error) => panic!("Problem with byte: {:?}", error),
        };
        counter += 1;
        maybe_newline = String::new();
    }

    let mut output_file = File::create("output.txt").expect("Error opening output file");
    output_file.write_all(bytey.as_bytes()).expect("Error writing to file");
}

/* thread 'main' panicked at 'Error reading file to string: Error { kind: InvalidData, message: "stream did not contain valid UTF-8" }', src\main.rs:11:48
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
error: process didn't exit successfully: `target\debug\tomfuckery.exe` (exit code: 101) */

// Maybe instead of read_to_string we use some sort of read_to_binary?
