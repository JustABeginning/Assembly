#ifdef __cplusplus
extern "C" {
#endif
// extern function declaration(s)
int printme();
int c_entry();
#ifdef __cplusplus
}
#endif

int c_entry() { return printme(); }
