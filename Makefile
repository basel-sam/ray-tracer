TARGET   = tracer
IDIR = include
IDIR1 = libraries
thr = 512
res = 1920x1080

CC       = g++
CFLAGS   = -I$(IDIR) -I$(IDIR1) -std=c++17 -Wall
LINKER   = g++
LFLAGS   = -Wall -I$(IDIR) -I$(IDIR1) -lm -lstdc++fs -lpthread -ljpeg 


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
	./$(TARGET) none $(res) $(thr) $(models) && mogrify -format png -- pictures/*.ppm && rm -f pictures/*.ppm

run-kd: $(TARGET)
	./$(TARGET) kd $(res) $(thr) $(models) && mogrify -format png -- pictures/*.ppm && rm -f pictures/*.ppm

run-bvh: $(TARGET)
	./$(TARGET) bvh $(res) $(thr) $(models) && mogrify -format png -- pictures/*.ppm && rm -f pictures/*.ppm

run-octree: $(TARGET)
	./$(TARGET) octree $(res) $(thr) $(models) && mogrify -format png -- pictures/*.ppm && rm -f pictures/*.ppm

.PHONY: clean
clean:
	@$(rm) $(OBJECTS)

.PHONY: remove
remove: clean
	@$(rm) $(TARGET)