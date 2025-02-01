enum NetworkError: Error {
    case badResponse
    case otherError(Error)
}

func fetchData() async throws -> Data {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.badResponse
    }
    return data
}

//Improved Error Handling
Task { 
    do {
        let data = try await fetchData() 
        //Process data
    } catch NetworkError.badResponse {
        print("Bad response from server with status code: ", (error as? NetworkError)?.localizedDescription ?? "Unknown")
    } catch let error as URLError {
        print("URL error: ", error.localizedDescription)
    } catch {
        print("An unexpected error occurred: ", error.localizedDescription)
    }
} 