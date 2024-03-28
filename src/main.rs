fn main() {
    let unused_variable = 123;
    //test
    let truth = true;
    if truth == true {
        println!("It's true!");
    }

    // This is not formatted according to Rust's standard style
    let badly_formatted = vec![1, 2, 3];

    println!("Hello, world!");
}

fn unused_function() {
    println!("This function is never used.");
}

#[allow(dead_code)]
struct UnusedStruct {
    a: i32,
}
