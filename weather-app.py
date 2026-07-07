import requests
from datetime import datetime, timedelta

def get_aws_data():
    # 1. API URL 및 설정 값 정의
    url = "https://apihub.kma.go.kr/api/typ01/cgi-bin/url/nph-aws2_min"
    AUTH_KEY = "blE3_YUlTT2RN_2FJZ091Q"
    STN_ID = "133"
    
    # 2. 현재 시각에서 3분을 뺀 시각 구하기 (실시간 데이터 적재 지연 고려)
    now = datetime.now()
    request_time = now - timedelta(minutes=3)
    target_time = request_time.strftime("%Y%m%d%H%M")
    
    # 3. API 요청 파라미터 설정
    params = {
        'tm2': target_time,
        'stn': STN_ID,
        'disp': '1',
        'help': '0',
        'authKey': AUTH_KEY
    } 
    
    print(f"[요청 시각] 현재 시간: {now.strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"[API 요청] 조회 대상 시각 (3분 전): {target_time}\n")
    
    try:
        # requests.get을 사용하여 API 호출
        response = requests.get(url, params=params)
        
        # HTTP 응답 상태 코드가 200(성공)인 경우
        if response.status_code == 200:
            raw_text = response.text
            lines = raw_text.strip().split('\n')
            
            for line in lines:
                # '#'으로 시작하는 주석/헤더 라인은 그대로 출력
                if line.startswith('#'):
                    continue
                else:
                    data_fields = line.split(',')
                    tmp = data_fields[8]
                    hmd = data_fields[14]

                    print(f"현재 대전 기온: {tmp} C")
                    print(f"현재 습도: {hmd} %")
        else:
            print(f" API 호출 실패 (Status Code: {response.status_code})")
            
    except Exception as e:
        print(f"에러 발생: {e}")

if __name__ == "__main__":
    get_aws_data()