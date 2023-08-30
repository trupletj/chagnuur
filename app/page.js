import LandingPage from "../components/Home/LandingPage";
import CoursesSec from "../components/Home/CoursesSec";
import Learnings from "../components/Home/Learnings";
import Educators from "../components/Home/Educators";
import WhySec from "../components/Home/WhySec";
import Rest from "../components/Home/Rest";
import Illustration from "../components/Home/Illustration";
import Header from "components/Header";
import Footer from "../components/Footer";

import { getServerSession } from "next-auth/next";
import { redirect } from "next/navigation";
import { options } from "/app/api/auth/[...nextauth]/options";

export default async function Home() {
  const session = await getServerSession(options);

  return (
    <main className=" bg-[#faf6f2] m-0 p-0">
      <Header />
      {/* main image  */}
      <LandingPage />
      {/* explore learning - carousel*/}
      <CoursesSec />
      {/* What will you learn today? - LIST */}
      <Learnings />
      {/* Top health educators  */}
      <Educators />
      {/* Why you'll love learning with Ausmed */}
      <WhySec />
      {/* Rest */}
      <Rest />
      {/* Illu */}
      <Illustration />
      {/* Footer */}
      <Footer />
    </main>
  );
}
