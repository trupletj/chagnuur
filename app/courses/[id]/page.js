import React from "react";
import Image from "next/image";
import { notFound } from "next/navigation";
import SingleCourseControlBar from "components/Courses/SingleCourseControlBar";
import parse from "html-react-parser";
import { getServerSession } from "next-auth/next";
import { options } from "/app/api/auth/[...nextauth]/options";

async function getCourse(id, headers, endpoint) {
  try {
    console.log(headers, endpoint);
    const res = await fetch(`${process.env.API_URL}${endpoint}`, {
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
    return course.data;
  } catch (error) {
    console.log(error);
  }
}

async function SingleCoursePage({ params }) {
  let headers;
  const session = await getServerSession(options);

  let endpoint = "/client/course/find";
  if (!session) {
    headers = { "Content-Type": "application/json" };
  } else {
    headers = {
      "Content-Type": "application/json",
      Authorization: `Bearer ${session.user.accessToken}`,
    };
    endpoint = "/api/course/find";
  }
  const course = await getCourse(params.id, headers, endpoint);
  if (!course) {
    notFound();
  }
  const { name, image, description, information } = course;
  // const {  } = course.data;
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

          {course &&
            course?.full_topics?.length > 0 &&
            course?.full_topics.map((topic) => (
              <div
                className="bg-white rounded-lg shadow-md p-4"
                key={topic.name}
              >
                <h2 className="text-xl font-semibold">{topic.name}</h2>
                <p className="text-gray-600">
                  {parse(topic.description?.toString() || "")}
                </p>
                <ul className="mt-2 ">
                  {topic?.lessons.map((lesson) => (
                    <li
                      key={lesson.name}
                      className="flex justify-between items-center border my-1 rounded px-1"
                    >
                      <div>
                        <h3 className="text-lg font-medium">{lesson.name}</h3>
                        <p className="text-gray-600">{lesson.description}</p>
                      </div>
                      <div className="text-gray-600">{lesson.duration}</div>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
        </div>
        <div className="w-1/4 h-[300px] rounded-md border overflow-hidden p-4"></div>
      </div>
    </>
  );
}

export default SingleCoursePage;
