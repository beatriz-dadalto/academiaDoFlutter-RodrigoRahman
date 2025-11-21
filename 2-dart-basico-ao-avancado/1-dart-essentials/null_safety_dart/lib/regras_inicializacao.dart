// variavel global preciso inicializar
int global = 1;
int? global2;

void main() {

}

int fibonacci(int n) {
  // variavel local não preciso inicializar
  int result;

  if (n < 2) {
    result = n;
  } else {
    result = fibonacci(n - 2) + fibonacci(n - 1);
  }

  print(result);
  return result;
}
