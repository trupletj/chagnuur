import { Prisma } from "@prisma/client";
import prisma from ".";

export default function getCourses(args : Prisma.CourseFindManyArgs) {
  return prisma.course.findMany(args);
}
