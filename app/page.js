import Header from "@/app/components/Header";
import LandingPage from "./components/Home/LandingPage";
import CoursesSec from "./components/Home/CoursesSec";
import Learnings from "./components/Home/Learnings";

export default function Home() {
  return (
    <main className=" bg-[#faf6f2] m-0 p-0">
      {/* header */}
      <Header />

      {/* main image  */}
      <LandingPage />
      {/* explore learning - carousel*/}
      <CoursesSec />
      {/* What will you learn today? - LIST */}
      <Learnings />
      {/* Top health educators  */}
      {/* Why you'll love learning with Ausmed */}
      {/* email input */}
    </main>
  );
}
