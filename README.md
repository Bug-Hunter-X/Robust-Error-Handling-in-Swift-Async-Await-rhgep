# Robust Error Handling in Swift Async/Await

This example demonstrates a common issue with async/await error handling in Swift: insufficient error handling in the `fetchData` function.  The current implementation only prints generic error messages. This repository provides a solution for more robust error handling.

## Problem
The original code lacks detailed error handling and lacks informative error messages which makes it hard to debug.

## Solution
The improved solution adds more detailed error handling and more informative error messages, such as specifying the underlying error.