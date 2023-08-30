export async function GET(request) {
  const res = await fetch(`${process.env.API_URL}/list`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      modelName: "Course",
      select: "*",
      relations: [],
      filters: [],
    }),
  });

  const courses = await res.json();
  return courses;
}
