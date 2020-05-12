TARGET   = tracer
IDIR = include

CC       = g++
CFLAGS   = -I$(IDIR) -std=c++17 -Wall
LINKER   = g++
LFLAGS   = -Wall -I$(IDIR) -lm -lstdc++fs -lpthread -ljpeg 


SRCDIR   = src
OBJDIR   = obj

SOURCES  := $(wildcard $(SRCDIR)/*.cpp)
INCLUDES := $(wildcard $(IDIR)/*.h)
OBJECTS  := $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
rm       = rm -f

DEPS2 := $(OBJ:.o=.d)
-include $(DEPS2)

$(TARGET): $(OBJECTS)
	@$(LINKER) $(OBJECTS) $(LFLAGS) -o $@
	
$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled "$<" successfully!"

run: $(TARGET)
	./$(TARGET)

.PHONY: clean
clean:
	@$(rm) $(OBJECTS)

.PHONY: remove
remove: clean
	@$(rm) $(TARGET)