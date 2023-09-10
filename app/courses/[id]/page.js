import React from "react";
import Image from "next/image";
import { notFound } from "next/navigation";
import SingleCourseControlBar from "components/Courses/SingleCourseControlBar";
import parse from "html-react-parser";
import { getServerSession } from "next-auth/next";
import { options } from "/app/api/auth/[...nextauth]/options";

async function getCourse(id, headers) {
  try {
    const res = await fetch(`${process.env.API_URL}/api/course/find`, {
      method: "POST",
      headers,
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
  let headers;

  const session = await getServerSession(options);
  if (!session) {
    headers = { "Content-Type": "application/json" };
  } else {
    headers = {
      "Content-Type": "application/json",
      Authorization: `Bearer ${session.accessToken}`,
    };
  }
  const course = await getCourse(params.id, headers);
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
