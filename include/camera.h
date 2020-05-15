#ifndef CAMERA_H
#define CAMERA_H
#include "ray.h"
#include <memory>

class Camera
{
private:
	Vec3 position, forward, right, up;
	double world_height, world_width;
public:
	Camera();
	Camera(Vec3 position, Vec3 target, Vec3 up_guide, double fov, double ratio);
	std::shared_ptr<Ray> create_camera_ray(double x, double y);
};

#endif

