#ifndef SPHERE_H
#define SPHERE_H
#include "object.h"
#include <cmath>

class Sphere : public Object
{
private:
	double radius;
	Vec3 position;
public:
	Sphere();
	Sphere(Vec3 position, double radius, Color color, Material material);
	virtual ~Sphere() override {}
	double get_radius();
	virtual bool intersected(std::shared_ptr<Ray> ray, int index, double& u, double& v, double& tmax);
	Vec3 get_normal(Vec3 point);
	virtual BBOX get_bbox();
};

#endif