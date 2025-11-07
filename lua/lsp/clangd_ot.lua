-- OpenTwin flags for clangd

local M = {}
M.flags = {
    "-xc++",
    "-std=c++17",

    "-fms-extensions",
    "-fms-compatibility",

    "--target=x86_64-pc-windows-msvc",

    "-D_WIN32",
    "-DWIN32",
    "-DWIN32_LEAN_AND_MEAN",
    "-D_CRT_SECURE_NO_WARNINGS",
    "-D_SCL_SECURE_NO_WARNINGS",

    -- Debug iterator level
    --"-D_ITERATOR_DEBUG_LEVEL=2",
    -- Release iterator level
    --"-D_ITERATOR_DEBUG_LEVEL=0",

    "-D_HAS_CXX17=1",

    -- OpenTwin Services
    "-IC:/OT/OpenTwin/Services/FDTDService/include",
    "-IC:/OT/OpenTwin/Services/FDTDService/include/Excitation",

    -- OpenTwin Libraries
    "-IC:/OT/OpenTwin/Libraries/OTCore/include",
    "-IC:/OT/OpenTwin/Libraries/OTModelAPI/include",
    "-IC:/OT/OpenTwin/Libraries/OTServices/include",
    "-IC:/OT/OpenTwin/Libraries/OTData/include",
    "-IC:/OT/OpenTwin/Libraries/OTApp/include",
    "-IC:/OT/OpenTwin/Libraries/OTUI/include",
    "-IC:/OT/OpenTwin/Libraries/OTNetwork/include",
    "-IC:/OT/OpenTwin/Libraries/OTLogger/include",
    "-IC:/OT/OpenTwin/Libraries/OTUtil/include",
    "-IC:/OT/OpenTwin/Libraries/OTMath/include",
    "-IC:/OT/OpenTwin/Libraries/OTGeometry/include",
    "-IC:/OT/OpenTwin/Libraries/OTModel/include",
    "-IC:/OT/OpenTwin/Libraries/OTCore/include/OTCore",
    "-IC:/OT/OpenTwin/Libraries/OTModelAPI/include/OTModelAPI",
    "-IC:/OT/OpenTwin/Libraries/OTServices/include/OTServices",
    "-IC:/OT/OpenTwin/Libraries/OTData/include/OTData",
    "-IC:/OT/OpenTwin/Libraries/OTApp/include/OTApp",
    "-IC:/OT/OpenTwin/Libraries/OTUI/include/OTUI",
    "-IC:/OT/OpenTwin/Libraries/OTNetwork/include/OTNetwork",
    "-IC:/OT/OpenTwin/Libraries/OTLogger/include/OTLogger",
    "-IC:/OT/OpenTwin/Libraries/OTUtil/include/OTUtil",
    "-IC:/OT/OpenTwin/Libraries/OTMath/include/OTMath",
    "-IC:/OT/OpenTwin/Libraries/OTGeometry/include/OTGeometry",
    "-IC:/OT/OpenTwin/Libraries/OTModel/include/OTModel",

    -- Libraries discovered in repo Libraries/ (roots)
    "-IC:/OT/OpenTwin/Libraries/BlockEntities/include",
    "-IC:/OT/OpenTwin/Libraries/CADModelEntities/include",
    "-IC:/OT/OpenTwin/Libraries/DataStorage/include",
    "-IC:/OT/OpenTwin/Libraries/LTSpiceConnector/include",
    "-IC:/OT/OpenTwin/Libraries/ModelEntities/include",
    "-IC:/OT/OpenTwin/Libraries/OTCommunication/include",
    "-IC:/OT/OpenTwin/Libraries/OTFrontendConnectorAPI/include",
    "-IC:/OT/OpenTwin/Libraries/OTGui/include",
    "-IC:/OT/OpenTwin/Libraries/OTGuiAPI/include",
    "-IC:/OT/OpenTwin/Libraries/OTRandom/include",
    "-IC:/OT/OpenTwin/Libraries/OTServiceFoundation/include",
    "-IC:/OT/OpenTwin/Libraries/OTSystem/include",
    "-IC:/OT/OpenTwin/Libraries/OTWidgets/include",
    "-IC:/OT/OpenTwin/Libraries/ResultDataAccess/include",
    "-IC:/OT/OpenTwin/Libraries/RubberbandEngineCore/include",
    "-IC:/OT/OpenTwin/Libraries/RubberbandEngineOsgWrapper/include",
    "-IC:/OT/OpenTwin/Libraries/StudioSuiteConnector/include",
    "-IC:/OT/OpenTwin/Libraries/Viewer/include",
    "-IC:/OT/OpenTwin/Libraries/uiCore/include",

    -- Common module subfolders
    "-IC:/OT/OpenTwin/Libraries/StudioSuiteConnector/include/StudioSuiteConnector",

    -- Third-Party Libraries (expand as needed)
    "-IC:/OT/ThirdParty/tinyxml2/tinyxml2-11.0.0",
    "-IC:/OT/ThirdParty/jsoncpp/include",
    "-IC:/OT/ThirdParty/boost/include",
    "-IC:/OT/ThirdParty/openssl/include",
    "-IC:/OT/ThirdParty/zlib/include",
    "-IC:/OT/ThirdParty/libpng/include",
    "-IC:/OT/ThirdParty/libjpeg/include",
    "-IC:/OT/ThirdParty/libtiff/include",
    "-IC:/OT/ThirdParty/libxml2/include",
    "-IC:/OT/ThirdParty/sqlite3/include",
    "-IC:/OT/ThirdParty/curl/include",
    "-IC:/OT/ThirdParty/protobuf/include",
    "-IC:/OT/ThirdParty/assimp/include",
    "-IC:/OT/ThirdParty/glew/include",
    "-IC:/OT/ThirdParty/glfw/include",
    "-IC:/OT/ThirdParty/imgui/include",
    "-IC:/OT/ThirdParty/stb/include",
    "-IC:/OT/ThirdParty/rapidjson/include",
    "-IC:/OT/ThirdParty/entt/include",
    "-IC:/OT/ThirdParty/sol2/include",
    "-IC:/OT/ThirdParty/spdlog/include",
    "-IC:/OT/ThirdParty/eigen/include",
    "-IC:/OT/ThirdParty/pybind11/include",
}

return M
