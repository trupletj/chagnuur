import React from "react";
import Image from "next/image";
import Link from "next/link";
import CoursesList from "components/Courses/CoursesList";
async function getCourses() {
  try {
    const res = await fetch(`${process.env.API_URL}/api/client/model/list`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        modelName: "Course",
        select: "name , image,id",
        relations: [],
        filters: [],
      }),
      next: { revalidate: 60 },
    });
    const courses = await res.json();

    return courses;
  } catch (error) {
    console.log(error);
  }
}

async function Courses() {
  const courses = await getCourses();

  if (!courses) {
    <div>Loading</div>;
  }
  const data = courses?.record?.data;
  return (
    <>
      <h1 className="font-bold text-2xl ">Сургалтууд</h1>
      <CoursesList data={data} />
    </>
  );
}

export default Courses;
