import React from "react";
import Image from "next/image";
import Link from "next/link";
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
  return (
    <>
      <h1 className="font-bold text-2xl ">Сургалтууд</h1>
      <div>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-2 w-full">
          {courses?.record?.data.map((course) => (
            <div
              key={course.name}
              className="col-span-1 bg-white border rounded-md overflow-hidden relative"
            >
              <div className="flex flex-col justify-between h-full">
                <Link href={`/courses/${course.id}`} className="flex flex-col">
                  <div className="relative aspect-[16/9] w-full">
                    <Image
                      alt="Picture of the Course"
                      src={course.image}
                      fill
                      style={{ objectFit: "cover" }}
                    />
                  </div>
                  <div className="text-sm relative h-[3.5rem my-2 px-3">
                    {course.name}
                  </div>
                </Link>
                <div className="px-3 mb-2">others</div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </>
  );
}

export default Courses;
