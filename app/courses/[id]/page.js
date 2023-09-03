import React from "react";
import Image from "next/image";
import { notFound } from "next/navigation";
import SingleCourseControlBar from "components/Courses/SingleCourseControlBar";
import parse from "html-react-parser";

async function getCourse(id) {
  try {
    const res = await fetch(`${process.env.API_URL}/api/course/find`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        modelName: "Course",
        id,
        select: "*",
        relations: ["full_topics"],
      }),
      cache: "no-store",
      revalidate: 0,
    });
    const course = await res.json();

    if (!course.data) {
      return null;
    }
    return course;
  } catch (error) {
    console.log(error);
  }
}

async function SingleCoursePage({ params }) {
  const course = await getCourse(params.id);
  if (!course) {
    notFound();
  }
  const { name, image, description, information } = course.data;
  return (
    <>
      <h1 className="text-2xl">{name}</h1>
      <SingleCourseControlBar id={params.id} />
      <div className="w-full flex  space-x-4">
        <div className="w-3/4  flex flex-col space-y-2">
          <div className="relative w-full aspect-video">
            <Image
              src={image}
              fill
              alt="Course main image"
              style={{ objectFit: "cover" }}
            />
          </div>

          {/* <h1>{course.record.name}</h1> */}
          <h2 className="font-bold text-xl py-10">Сургалтын мэдээлэл</h2>
          <div className=""> {parse(description?.toString() || "")}</div>
          <div> {parse(information?.toString() || "")}</div>
        </div>
        <div className="w-1/4 h-[300px] rounded-md border overflow-hidden p-4"></div>
      </div>
    </>
  );
}

export default SingleCoursePage;
