#pragma once

#include <vector>
#include "condition.h"

struct AssignOperations
{
	std::vector<Condition> conds;

	AssignOperations();
	AssignOperations(const std::vector<Condition>&);

	friend std::istream& operator>>(std::istream&, AssignOperations&);
};