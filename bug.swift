func fetchData() async throws -> Data {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.badResponse
    }
    return data
}

//Error Handling
Task { 
    do {
        let data = try await fetchData() 
        //Process data
    } catch NetworkError.badResponse {
        print("Bad response from server")
    } catch {
        print("An unexpected error occurred")
    }
}