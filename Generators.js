// Blog : https://dev.to/beccaliz/es6-generators-for-state-management-in-react-h7b

// This is ordinary Iterator
//   - which returns next and a done boolean flag.
function natural_num_iterator() {
  var n = 0;
  
  return {
    next: () => {
      if (n < 10) {
        n += 1
        return {
          next: n,
          done: false
        }
      } else {
        return {
          next: undefined,
          done: true
        }
      }
    }
  }
}

let natural_numbers_iterato = natural_num_iterator();

for (var i = 0; i<11; i++) {
  console.log(natural_numbers_iterato.next());
}

console.log("******* Now Using Generators *********")

// Generators are functions that can be exited and later re-entered. Their context (variable bindings) will be saved across re-entrances.

/* Now we have good knowledge around Iterator, we can start Generators.  */
//    - Generators are special functions that do some 
//        ES6 magic for you to create an iterator. 
//    - Generators can be super helpful for asynchronous programming

function* natural_num_generator() {
  let n = 0;
  
  while (n < 10) {
    n += 1;
    yield n;
  }
}

let natural_numbers_generator = natural_num_generator();

for (var i = 0; i<11; i++) {
  console.log(natural_numbers_generator.next());
}


// Output:
{ next: 1, done: false }
{ next: 2, done: false }
{ next: 3, done: false }
{ next: 4, done: false }
{ next: 5, done: false }
{ next: 6, done: false }
{ next: 7, done: false }
{ next: 8, done: false }
{ next: 9, done: false }
{ next: 10, done: false }
{ next: undefined, done: true }

******* Now Using Generators *********
{ value: 1, done: false }
{ value: 2, done: false }
{ value: 3, done: false }
{ value: 4, done: false }
{ value: 5, done: false }
{ value: 6, done: false }
{ value: 7, done: false }
{ value: 8, done: false }
{ value: 9, done: false }
{ value: 10, done: false }
{ value: undefined, done: true }
