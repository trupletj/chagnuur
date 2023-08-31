import React from "react";

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
  return <div>SingleCoursePage {params.id}</div>;
}

export default SingleCoursePage;
