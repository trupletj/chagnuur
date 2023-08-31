import React from "react";
import Image from "next/image";
import { notFound } from "next/navigation";
import parse from "html-react-parser";
async function getCourse(id) {
  try {
    const res = await fetch(`${process.env.API_URL}/api/client/model/find`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        modelName: "Course",
        id,
        select: "*",
        relations: ["full_topics"],
        filters: [],
      }),
    });
    const course = await res.json();
    if (!course.record) {
      return null;
    }
    return course;
  } catch (error) {
    console.log(error);
  }
}

async function SingleCoursePage({ params }) {
  const course = await getCourse(params.id);
  const { name, image, description, information } = course.record;
  if (!course) {
    notFound();
  }
  return (
    <>
      <h1 className="text-2xl">{name}</h1>
      <div className="flex justify-between">
        <div>tags</div>
        <div>Buttons</div>
      </div>
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
          <div className=""> {parse(description)}</div>
          <div> {parse(information)}</div>
        </div>
        <div className="w-1/4 h-[300px]  rounded-xl border overflow-hidden p-4"></div>
      </div>
    </>
  );
}

export default SingleCoursePage;
