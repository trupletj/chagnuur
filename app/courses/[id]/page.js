import React from "react";
import Image from "next/image";
async function getCourse(id) {
  try {
    const res = await fetch(`${process.env.API_URL}/api/client/model/list`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        modelName: "Course",
        select: "name , image",
        relations: [],
        filters: [id],
      }),
    });
    const courses = await res.json();

    return courses;
  } catch (error) {
    console.log(error);
  }
}

function SingleCoursePage({ params }) {
  return (
    <>
      <h1>Free CPD Course for Nurses and Midwives</h1>
      <div>Tags bar</div>
      <div className="w-full flex bg-green-100 space-x-4">
        <div className="w-3/4  flex flex-col space-y-2">
          <div className="relative w-full aspect-video">
            <Image
              src="https://picsum.photos/600/300"
              fill
              alt="Course main image"
              style={{ objectFit: "cover" }}
            />
          </div>
          <h1>Course overview</h1>
        </div>
        <div className="w-1/4 h-[300px]  rounded-xl border overflow-hidden p-4"></div>
      </div>
    </>
  );
}

export default SingleCoursePage;
