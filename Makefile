CROSS_COMPILE 	?= 
TARGET		  	?= gateway

CC 				:= $(CROSS_COMPILE)gcc
LD				:= $(CROSS_COMPILE)ld
OBJCOPY 		:= $(CROSS_COMPILE)objcopy
OBJDUMP 		:= $(CROSS_COMPILE)objdump

INCDIRS 		:= ./ udp thread
				   			   
SRCDIRS			:= ./ udp thread
				   
				   
INCLUDE			:= $(patsubst %, -I %, $(INCDIRS))

CFILES			:= $(foreach dir, $(SRCDIRS), $(wildcard $(dir)/*.c))   #匹配剩下的.c文件

CFILENDIR		:= $(notdir  $(CFILES))			#去掉路径，剩下文件名

COBJS			:= $(patsubst %, obj/%, $(CFILENDIR:.c=.o))			#目标中的所有.o文件
OBJS			:= $(COBJS)			#目标路径

VPATH			:= $(SRCDIRS)

.PHONY: clean
.PHONY: a	
$(TARGET) : $(OBJS)
	$(CC) -o $(TARGET) $^ -lpthread
	#$(LD)  -o $(TARGET).elf $^
	#$(OBJCOPY) -O binary -S $(TARGET).elf $@
	#$(OBJDUMP) -D -m arm $(TARGET).elf > $(TARGET).dis

$(COBJS) : obj/%.o : %.c
	$(CC) -Wall -nostdlib -c -O2  $(INCLUDE) -o $@ $< 
	
clean:
	rm -rf $(TARGET)  $(COBJS)
a:
	./$(TARGET)