#![no_std]
use derive_more::Add;

#[derive(Add)]
pub struct MyInt(pub i32);
