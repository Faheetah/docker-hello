FROM alpine
COPY hello.asm /hello.asm
RUN apk --no-cache add nasm gcc
RUN nasm -f elf64 hello.asm
RUN ld -m elf_x86_64 -s -o hello hello.o

FROM scratch
COPY --from=0 /hello /hello
CMD ["/hello"]
