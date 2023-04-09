#ifdef __cplusplus
extern "C" {
#endif
int printme();
// other function declaration(s)
#ifdef __cplusplus
}
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-function-declaration"

int main() { return printme(); }
