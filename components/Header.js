"use client";
import { useState, useEffect } from "react";
import { useSession } from "next-auth/react";
import Link from "next/link";
export default function Header() {
  const [navbar, setNavbar] = useState(false);
  const { user } = useSession();
  //background change
  const [color, setColor] = useState(0);
  useEffect(() => {
    if (typeof window !== "undefined") {
      const handleScroll = (event) => {
        if (window.scrollY >= 20) setColor(true);
        else setColor(false);
      };

      window.addEventListener("scroll", handleScroll);

      return () => {
        window.removeEventListener("scroll", handleScroll);
      };
    }
  }, []);

  return (
    <nav
      className={`w-full fixed top-0 z-40 h-[80px] ${
        color ? "bg-[#001540]" : "bg-[#001540]/[0]"
      }`}
    >
      <div className="justify-start container md:items-center md:flex ">
        <div>
          <div className="flex items-center justify-between py-3 md:py-5 md:block">
            <a href="#">
              <h2 className="text-2xl text-white font-bold  ">Chagnuur</h2>
            </a>
            <div className="md:hidden">
              <button
                className="p-2 text-gray-700 rounded-md outline-none focus:border-gray-400 focus:border"
                onClick={() => setNavbar(!navbar)}
              >
                {navbar ? (
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="w-6 h-6 text-white"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                  >
                    <path
                      fillRule="evenodd"
                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                      clipRule="evenodd"
                    />
                  </svg>
                ) : (
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="w-6 h-6 text-white"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    strokeWidth={2}
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M4 6h16M4 12h16M4 18h16"
                    />
                  </svg>
                )}
              </button>
            </div>
          </div>
        </div>
        <div>
          <div
            className={`flex-1 justify-self-center ml-20 mt-8 md:block md:pb-0 md:mt-0 ${
              navbar ? "block" : "hidden"
            }`}
          >
            <ul className="items-center justify-center space-y-8 md:flex md:space-x-6 md:space-y-0 text-sm ">
              <li className="text-white">
                <Link href="/">Сургалт</Link>
              </li>
              <li className="text-white">
                <Link href="/blogs">Статистик</Link>
              </li>
              <li className="text-white">
                <Link href="/about">Бидний тухай</Link>
              </li>
              <li className="text-white">
                <Link href="/contact">Анхны тусламж</Link>
              </li>
              <li className="text-white">
                <Link href="/contact">user: {JSON.stringify(user)}</Link>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
  );
}
