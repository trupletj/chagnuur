"use client";
import React, {
  useState,
  useRef,
  useEffect,
  useLayoutEffect,
  useMemo,
} from "react";
import Image from "next/image";

//images
import img1 from "@/app/assets/20200702_cover_v2.jpg";
import img2 from "@/app/assets/20210802_cover_2.jpg";
import img3 from "@/app/assets/AUSLEC2044v1.jpg";
import img4 from "@/app/assets/AUSLEC2045v1.jpg";
import img5 from "@/app/assets/AUSLEC2060v1.jpg";

//hooks
import useWindowSize from "@/app/hooks/useWindowSize";
const texts = [
  "Text 1 dasd d ",
  "Text 2 fasdfasd ",
  "Text 3 fddfasdf ",
  "Textffd 4 fdd f 4ff ",
  "Text 5 dfasdf",
  "Text 6 fd",
  "Text 7 f",
  "Text 8dasdfas",
  "Text 9 fdasf",
  "Text 1dasdf0",
  "Text 11 fdasf",
  "Text 12 ffff",
  "Text 13",
  "Text 14dasdfasdf",
  "Text 15 fdf  fdasdfasdf asdf",
  "Text 16daasdf ",
  "Text 17 fdasdfasd dd",
  "Text 18fas dfasdd ",
  "Text 19fasdf ",
  "Text 20 fddd",
];
const thumbs = [
  {
    url: img1,
    title: "114  adsafasd fasd fasdf asdf asdf khgfds s sss",
  },
  { url: img2, title: "2" },
  { url: img3, title: "3" },
  { url: img4, title: "4" },
  { url: img5, title: "5" },
  { url: img3, title: "6" },
  { url: img2, title: "7" },
  { url: img5, title: "8" },
  { url: "https://picsum.photos/600/300", title: "9" },
  { url: img1, title: "10" },
  { url: "https://picsum.photos/600/300", title: "11" },
  { url: img3, title: "12" },
  { url: "https://picsum.photos/600/300", title: "13" },
];
function CoursesSec() {
  const [currentCategory, setCurrentCategory] = useState(0);
  const categoryTitleRef = useRef(null);
  const carouselRef = useRef(null);
  const windowSize = useWindowSize();

  const scroller = (ref, unit, direction) => {
    if (direction === "left") {
      ref.current.scrollLeft -= unit;
    } else ref.current.scrollLeft += unit;
  };

  //carousel
  const [parentWidth, setParentWidth] = useState(0);
  const [childWidth, setChildWidth] = useState(0);

  const [currentPage, setCurrentPage] = useState(1);
  const [perPage, setPerPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);

  const onPageChange = (goTo) => {
    let index;
    console.log(perPage);
    index = goTo * perPage - perPage;
    carouselRef.current.scrollLeft =
      carouselRef?.current?.children[index].offsetLeft -
      carouselRef.current.firstChild.offsetLeft;
    setCurrentPage(goTo);
  };

  const scrollLeft = () => {
    currentPage > 1 ? onPageChange(currentPage - 1) : onPageChange(1);
  };
  const scrollRight = () => {
    currentPage < totalPages
      ? onPageChange(currentPage + 1)
      : onPageChange(totalPages);
  };

  function handleResize() {
    if (parentWidth < 560) {
      {
        setChildWidth(parentWidth / 1.2);
        setPerPage(() => 1);
      }
    } else if (parentWidth >= 560 && parentWidth < 768) {
      setChildWidth(parentWidth / 2.2);
      setPerPage(2);
    } else if (parentWidth >= 768 && parentWidth < 1024) {
      setChildWidth(parentWidth / 3.2);
      setPerPage(3);
    } else if (parentWidth >= 1024 && parentWidth < 1920) {
      setChildWidth(parentWidth / 4 - 10);
      setPerPage(4);
    } else {
      setChildWidth(300);
      setPerPage(4);
    }
    let total = Math.ceil(carouselRef.current.childElementCount / perPage);
    setTotalPages(total);
  }

  useLayoutEffect(() => {
    setParentWidth(carouselRef.current.offsetWidth);
    setPerPage(
      Math.floor(
        carouselRef.current.clientWidth /
          carouselRef.current.firstChild.clientWidth
      )
    );
    console.log("useEffect", totalPages);
    handleResize();
  }, [perPage, totalPages, currentPage, windowSize.width, parentWidth]);
  return (
    <div className="py-20 ">
      <div className="container">
        <h1 className="font-[700] text-[40px] leading-[52px] mb-[1rem]  text-center">
          Explore Learning
        </h1>
        <div className="flex  items-center space-x-8 w-full xl:w-[700px]  lg:mx-auto ">
          <button
            onClick={() =>
              scroller(
                categoryTitleRef,
                categoryTitleRef.current.clientWidth,
                "left"
              )
            }
            className="px-2 py-2 bg-white border-2  border-transparent focus:shadow-[0px_0px_0px_3px_#f44f6c40]
        rounded-full"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              strokeWidth={2}
              stroke="currentColor"
              className="w-6 h-6"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M15.75 19.5L8.25 12l7.5-7.5"
              />
            </svg>
          </button>
          <ul
            ref={categoryTitleRef}
            className="flex items-center flex-auto w-full space-x-2 no-scrollbar overflow-x-scroll scroll-smooth snap-x"
          >
            {texts.map((text, index) => (
              <li
                key={index}
                className={`p-2 flex-shrink-0 font-bold snap-start cursor-pointer`}
                onClick={() => setCurrentCategory(index)}
              >
                <p className=" my-[12px] leading-[20px] font-[600]">{text}</p>
                <div
                  className={`h-[4px] selection ${
                    currentCategory === index && "selection-active"
                  }`}
                ></div>
              </li>
            ))}
          </ul>
          <button
            onClick={() =>
              scroller(
                categoryTitleRef,
                categoryTitleRef.current.clientWidth,
                "right"
              )
            }
            className="px-2 py-2 bg-white border-2  border-transparent focus:shadow-[0px_0px_0px_3px_#f44f6c40]
        rounded-full"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              strokeWidth={2}
              stroke="currentColor"
              className="w-6 h-6"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M8.25 4.5l7.5 7.5-7.5 7.5"
              />
            </svg>
          </button>
        </div>
      </div>

      <div className="container">
        <div className="w-full  mx-auto xl:max-w-[1230px]">
          <ul
            className="flex overflow-x-scroll scroll-smooth space-x-3 w-full no-scrollbar "
            ref={carouselRef}
          >
            {thumbs.map((thumb, index) => (
              <li
                className="flex flex-col snap-start  text-[#171d29]  font-[500] mt-[12px] cursor-pointer group"
                id={index}
                key={thumb.title + index}
              >
                {/* image */}
                <div
                  className={`rounded-xl overflow-hidden relative`}
                  style={{ width: childWidth, height: childWidth / 2 }}
                >
                  <Image
                    fill
                    src={thumb.url}
                    alt="custom image"
                    style={{ objectFit: "cover" }}
                  />
                </div>
                {/* category */}
                <span className="font-bold  text-[1rem]  mt-[12px] text-[#6f7786] ">
                  Category
                </span>
                {/* title */}
                <span className="font-[700] mt-[12px] text-[1rem] break-words cursor-pointer group-hover:text-[#6f7786]">
                  {thumb.title}
                </span>
                {/* teacher */}
                <span className="mt-[12px] text-[#4e545f] text-[0.875rem] font-[400]">
                  John Wick
                </span>
                {/* dration */}
                <span className="mt-[12px] text-[#0e3789] font-[500] text-[0.875rem]">
                  38m
                </span>
              </li>
            ))}
          </ul>

          <div className="grid  grid-flow-col w-full  space-x-8 items-center justify-center mt-[1rem] h-[80px] ">
            <button
              onClick={() => scrollLeft()}
              className="px-2 py-2 bg-white border-2  border-transparent focus:shadow-[0px_0px_0px_3px_#f44f6c40]
        rounded-full"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                strokeWidth={2}
                stroke="currentColor"
                className="w-6 h-6"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M15.75 19.5L8.25 12l7.5-7.5"
                />
              </svg>
            </button>
            <ul className="flex items-center space-x-8 no-scrollbar overflow-x-scroll scroll-smooth snap-x">
              {[...Array(totalPages)].map((x, i) => (
                <li
                  className={`semi-circle cursor-pointer flex-shrink-0 ${
                    currentPage === i + 1 ? "active " : ""
                  }`}
                  key={i}
                  onClick={() => {
                    onPageChange(i + 1);
                  }}
                />
              ))}
            </ul>

            <button
              onClick={() => scrollRight()}
              className=" px-2 py-2 bg-white border-2  border-transparent focus:shadow-[0px_0px_0px_3px_#f44f6c40]
        rounded-full"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                strokeWidth={2}
                stroke="currentColor"
                className="w-6 h-6"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M8.25 4.5l7.5 7.5-7.5 7.5"
                />
              </svg>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default CoursesSec;
