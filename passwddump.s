####### PRACTICA 1 ############

.global _start #indicar donde empieza la ejecucion del programa

.data

ruta: .string "/etc/passwd"
buffer: .space 64 

.text
_start:

### PASOS ####
# 1: OPEN
# 2: READ
# 3: WRITE

##### OPEN FILE #####

	mov $2, %rax
	mov $ruta, %rdi  #path
	mov $0, %rsi    #flag O_RDONLY
	mov $644, %rdx   #permisos
	syscall
	
	mov %rax, %r12  #almaceno el file descriptor de nuestro fichero abierto en el $r12
	
	cmp $0, %rax
	jl errorOpen
while: 	
	

##### READ FILE ######
	
	mov $0,%rax
	mov %r12, %rdi
	mov $buffer, %rsi
	mov $64, %rdx
	syscall

####### COMPARACION SI LECTURA DEVUELVE 0, NO LEE NADA

if:
	cmp $0, %rax
	je fin
	
##### HACEMOS EL WRITE #####
	
	mov $1, %rax
	mov $1, %rdi
	mov $buffer, %rsi
	mov $64, %rdx
	syscall
	
	jmp while
	
fin:

	mov $60, %rax
	mov $0, %rdi
	syscall
	
errorOpen:
	mov $60, %rax
	mov $1, %rdi
	syscall
	
	
