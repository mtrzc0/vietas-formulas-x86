.386
.model flat,c

.code
	vietasEqs proc

;Function prolog
		push ebp
		mov ebp, esp
		sub esp, 8
		push ebx
		push esi
		push edi

;Loading Function arguments
		mov edx, [ebp + 8]			;edx = a
		mov ebx, [ebp + 12]			;ebx = b
		mov ecx, [ebp + 16]			;ecx = c
		mov esi, [ebp + 20]			;esi = *x1x2
		mov edi, [ebp + 24]			;edi = *x1_plus_x2

;Clear return register EAX
		xor eax, eax

;Check if c = 0
		or ecx, ecx
		jz divByZero

;Calculating the x1*x2 = a/c
		mov eax, edx
		cdq
		idiv ecx	
		mov [ebp-4], eax

;Calculating the x1+x2 = -b/c
		mov eax, ebx
		cdq
		idiv ecx
		imul eax, -1
		mov [ebp-8], eax

;Storing the results
		mov eax, [ebp-4]
		mov [esi], eax

		mov eax, [ebp-8]
		mov [edi], eax

;Function epilog
		pop edi
		pop esi
		pop ebx
		mov esp, ebp
		pop ebp

;Return 1
		mov eax, 1

divByZero:
		ret

vietasEqs endp
end
